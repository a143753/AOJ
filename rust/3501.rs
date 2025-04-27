use std::io::BufRead;
use std::str::FromStr;

fn read_row_vec<T: std::str::FromStr>(reader: &mut std::io::StdinLock) -> Vec<T>
where
    <T as std::str::FromStr>::Err: std::fmt::Debug,
{
    let mut row = Vec::new();
    reader.lines().take(1).for_each(|line| {
        row = line
            .unwrap()
            .split_whitespace()
            .map(|x| x.parse::<T>().unwrap())
            .collect::<Vec<_>>();
    });
    row
}
fn read_matrix<T: std::str::FromStr>(
    reader: &mut std::io::StdinLock,
    n: usize,
    s: char,
) -> Vec<Vec<T>>
where
    <T as std::str::FromStr>::Err: std::fmt::Debug,
{
    fn sub<T: std::str::FromStr>(line: &str, s: char) -> Vec<T>
    where
        <T as FromStr>::Err: std::fmt::Debug,
    {
        if s == ' ' {
            line.split_whitespace()
                .map(|x| x.parse::<T>().unwrap())
                .collect::<Vec<_>>()
        } else {
            line.split(s)
                .map(|x| x.parse::<T>().unwrap())
                .collect::<Vec<_>>()
        }
    }

    let mut matrix = Vec::new();
    if n == 0 {
        reader.lines().for_each(|line| {
            let dt = sub::<T>(&line.unwrap(), s);
            matrix.push(dt);
        });
    } else {
        reader.lines().take(n as usize).for_each(|line| {
            let dt = sub::<T>(&line.unwrap(), s);
            matrix.push(dt);
        });
    }
    matrix
}

fn f( a:i64, b:i64, x:i64) -> i64 {
	a * x + b
}

fn main() {
	let reader = std::io::stdin();
	let nq = read_row_vec::<usize>(&mut reader.lock());
	let n = nq[0];
	let q = nq[1];

	let abs = read_matrix::<i64>(&mut reader.lock(), n, ' ');
	let lrp = read_matrix::<i64>(&mut reader.lock(), q, ' ');

    for i in 0..q {
		let l = lrp[i][0] as usize;
		let r = lrp[i][1] as usize;
		let p = lrp[i][2];

		let mut t = Vec::new();

		for j in l..=r {
			let a = abs[j-1][0];
			let b = abs[j-1][1];
			t.push(f(a, b, p));
		}
		
		println!("{:?}", t.iter().min().unwrap());
	}
}
