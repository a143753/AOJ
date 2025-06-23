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
	let stdin = std::io::stdin();
	let mut reader = stdin.lock();

	let n: f64 = read_scalar(&mut reader);

	let h = ( n / 30.0 ).floor() as u32;
	let m =( n % 30.0 * 2.0) as u32;

	println!("{} {}", h, m);
	
}
