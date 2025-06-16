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
	let _ : i32= read_scalar(&mut reader);

	// Read a row vector of integers
	let v: Vec<i32> = read_row_vec(&mut reader);

	let mut mv = v[0];
	let mut mi = 0;

	for j in 0..v.len() {
		if v[j] < mv {
			mv = v[j];
			mi = j;
		}
	}
	println!("{}", mi + 1);

}
