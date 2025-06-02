use std::io::BufRead;

fn read_scalar<T: std::str::FromStr>(reader: &mut std::io::StdinLock) -> T
where
    <T as std::str::FromStr>::Err: std::fmt::Debug,
{
    let mut scalar = None;
    reader.lines().take(1).for_each(|line| {
        scalar = Some(line.unwrap().parse::<T>().unwrap());
    });
    scalar.unwrap()
}

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

fn main() {
	let stdin = std::io::stdin();
	let mut reader = stdin.lock();

	// Read a single scalar value
	loop {
		let n = read_scalar::<usize>(&mut reader);
		if n == 0 {
			break;
		} else {
			let abcd =read_row_vec::<i64>(&mut reader);
			let a = abcd[0];
			let b = abcd[1];
			let c = abcd[2];
			let d = abcd[3];

			let mut s1 = 0;
			for i in a..=c {
				s1 += i;
			}
			s1 %= 1000000007;
			let mut s2 = 0;
			for j in b..=d {
				s2 += s1 * j;
			}
			s2 %= 1000000007;
			println!("{}", s2);
		}
	}
}
