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

fn solve(d: Vec<i32>) -> i32 {
	let e :Vec<i32>= d.iter().map(|x|
						 if *x < 40 {
							 40
						 } else {
							 *x
						 }).collect();
	e.iter().sum::<i32>() / 5
}

fn main() {
	let stdin = std::io::stdin();
	let mut reader = stdin.lock();
	let d : Vec<i32>= read_col_vec(&mut reader, 5);

	let ans = solve(d);
	println!("{}", ans);
}
