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

	// Read the number of elements
	let _ = read_scalar::<usize>(&mut reader);
	let s = read_row_vec::<i64>(&mut reader);
	
	let _ = read_scalar::<usize>(&mut reader);
	let t = read_row_vec::<i64>(&mut reader);

	let mut n = 0;
	t.iter().for_each(|&x| {
		if s.contains(&(x)) {
			n += 1;
		}
	});
	
	// Output the result
	println!("{}", n);
}
