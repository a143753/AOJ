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

fn mul1( a: (u64, u64, u64, u64, u64, u64, u64, u64, u64), b: (u64, u64, u64, u64, u64, u64, u64, u64, u64) ) -> (u64, u64, u64, u64, u64, u64, u64, u64, u64) {
	(
		( a.0 * b.0 + a.1 * b.3 + a.2 * b.6 ) % 1000000007,
		( a.0 * b.1 + a.1 * b.4 + a.2 * b.7 ) % 1000000007,
		( a.0 * b.2 + a.1 * b.5 + a.2 * b.8 ) % 1000000007,
		( a.3 * b.0 + a.4 * b.3 + a.5 * b.6 ) % 1000000007,
		( a.3 * b.1 + a.4 * b.4 + a.5 * b.7 ) % 1000000007,
		( a.3 * b.2 + a.4 * b.5 + a.5 * b.8 ) % 1000000007,
		( a.6 * b.0 + a.7 * b.3 + a.8 * b.6 ) % 1000000007,
		( a.6 * b.1 + a.7 * b.4 + a.8 * b.7 ) % 1000000007,
		( a.6 * b.2 + a.7 * b.5 + a.8 * b.8 ) % 1000000007
	)
}

fn mul2( a: (u64, u64, u64, u64, u64, u64, u64, u64, u64), b: (u64, u64, u64) ) -> (u64, u64, u64) {
	(
		( a.0 * b.0 + a.1 * b.1 + a.2 * b.2 ) % 1000000007,
		( a.3 * b.0 + a.1 * b.1 + a.2 * b.2 ) % 1000000007,
		( a.6 * b.0 + a.7 * b.1 + a.8 * b.2 ) % 1000000007
	)
}

fn f( n0 : u64 ) -> u64 {

	let mut s = (1,0,0, 0,1,0, 0,0,1);
	let mut m = (0,1,1, 1,0,0, 0,1,0);
	let mut n = n0 - 3;
	while n > 0 {
		if n % 2 == 1 {
			s = mul1(m, s);
		}
		m = mul1(m, m);
		n /= 2;
	}
	mul2( s, (1,1,0) ).0
}

fn main() {
	let stdin = std::io::stdin();
	let mut reader = stdin.lock();

	let n: u64 = read_scalar(&mut reader);
	let a: u64 = f( n );
	println!("{}", a);
}
