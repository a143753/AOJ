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

fn main() {
	let reader = std::io::stdin();
	let mut d = read_scalar::<i32>(&mut reader.lock());

	let mut n = 0;
	while d > 1 {
		d /= 2;
		n += 1;
	}
	println!("{}",2_i32.pow(n));
}
