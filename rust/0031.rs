use std::io::BufRead;

fn read_col_vec<T: std::str::FromStr>(reader: &mut std::io::StdinLock, n: usize) -> Vec<T>
where
    <T as std::str::FromStr>::Err: std::fmt::Debug,
{
    let mut col = Vec::new();
    if n == 0 {
        reader.lines().for_each(|line| {
            let d = line.unwrap().parse::<T>().unwrap();
            col.push(d);
        });
    } else {
        reader.lines().take(n as usize).for_each(|line| {
            let d = line.unwrap().parse::<T>().unwrap();
            col.push(d);
        });
    }
    col
}

fn f(x: i32) -> Vec<i32> {
	let mut n = 1;
	let mut t = x;
	let mut r = Vec::new();

	while t > 0 {
		if t % 2 == 1 {
			r.push(n);
		}
		n *= 2;
		t /= 2;
	}
	r
}

fn main() {
	let stdin = std::io::stdin();
	let mut reader = stdin.lock();
	let data: Vec<i32> = read_col_vec(&mut reader, 0);
	
	// 読み取ったデータを表示
	for item in data {
		let ans = f(item);
		println!("{}", ans.iter().map(|x| x.to_string()).collect::<Vec<_>>().join(" "))
	}
}
