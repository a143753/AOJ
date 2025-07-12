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

fn ans( a: &[u32], m: u32) -> bool {
	if m < a[0] {
		return false;
	} else if m == a[0] {
		return true;
	} else if a.len() == 1 {
		return false;
	} else {
		let b = ans( &a[1..].to_vec(), m - a[0]);
		let c = ans( &a[1..].to_vec(), m);
		return b || c;
	}

}

fn main() {
	let stdin = std::io::stdin();
	let mut reader = stdin.lock();

	let _n: usize = read_scalar(&mut reader);
	let mut a: Vec<u32> = read_row_vec(&mut reader);
	a.sort();
	let _q: usize = read_scalar(&mut reader);
	let m: Vec<u32> = read_row_vec(&mut reader);

	m.iter().for_each(|&x| {
		println!("{}", if ans(&a, x) { "yes" } else { "no" });
	});
}
