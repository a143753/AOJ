use std::io::BufRead;

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

fn read_line(reader: &mut std::io::StdinLock) -> String {
    let mut buf = String::new();
    reader.read_line(&mut buf).unwrap();
    buf.trim().to_string()
}

fn main() {
	let stdin = std::io::stdin();
	let mut reader = stdin.lock();

	let _n = read_row_vec::<i32>(&mut reader);
	let s: Vec<char> = read_line(&mut reader).chars().collect();

    let (mut ua, mut uz, mut la, mut lz) = (0usize, 0usize, 0usize, 0usize);
    for c in s.iter() {
        match c {
            'A'..='M' => ua += 1,
            'N'..='Z' => uz += 1,
            'a'..='m' => la += 1,
            'n'..='z' => lz += 1,
            _ => {}
        }
    }	

	let mut r = String::new();
    r.extend(std::iter::repeat('A').take(ua.saturating_sub(uz)));
    r.extend(std::iter::repeat('Z').take(uz.saturating_sub(ua)));
    r.extend(std::iter::repeat('a').take(la.saturating_sub(lz)));
    r.extend(std::iter::repeat('z').take(lz.saturating_sub(la)));
	
	println!("{}", r.len());
	println!("{}", r);
}
