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

fn fibonacci(n: usize) -> usize {
	if n == 0 {
		return 1;
	} else if n == 1 {
		return 1;
	}
	let mut a = 1;
	let mut b = 1;
	for _ in 2..=n {
		let c = a + b;
		a = b;
		b = c;
	}
	b
}

fn main() {
	let stdin = std::io::stdin();
	let mut reader = stdin.lock();

	let n: usize = read_scalar(&mut reader);
	let a = fibonacci(n);

	println!("{}", a);
}
