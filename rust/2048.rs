use std::io::BufRead;

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
fn factorize1(mut n: i64) -> Vec<(i64, i64)> {
	let mut res = Vec::new();
	let mut i = 2;
	while i * i <= n {
		if n % i == 0 {
			let mut cnt = 0;
			while n % i == 0 {
				n /= i;
				cnt += 1;
			}
			res.push((i, cnt));
		}
		i += 1;
	}
	if n != 1 {
		res.push((n, 1));
	}
	res
}

fn values(f:Vec<(i64,i64)>)->Vec<i64>{
	let mut res = Vec::new();
	for (p, _) in f {
		res.push(p);
	}
	res
}

fn key(s:Vec<i64>)->i64{
	let r = s[0..s.len()-1].iter().fold(0, |acc, x| acc + x);
	return s[s.len()-1] - r
}

fn solve(a:i64,b:i64)->String{
	let fa = values( factorize1(a) );
	let fb = values( factorize1(b) );
	let ka = key(fa.clone());
	let kb = key(fb.clone());

	if ka >= kb {
		"a".to_string()
	} else{
		"b".to_string()
	}
}

fn main(){
	let stdin = std::io::stdin();
	let mut reader = stdin.lock();

	loop {
		let ab = read_row_vec(&mut reader);
		let a =ab[0];
		let b =ab[1];
		if a == 0 && b == 0 {
			break;
		}
		println!("{}",solve(a,b));
	}
}
