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

fn solve(a:i32,b:i32,c:i32) -> i32 {

	let w = c / (a*7+b);
	let r = c % (a*7+b);

	let d =
		if r / a < 7{
			if r % a == 0 {
				r / a
			} else {
				r / a + 1
			}
		} else {
			7
		};
	
//	println!("w: {}, r: {}, d: {}", w, r, d);
	
	w*7 + d
}


fn main() {
	let stdin = std::io::stdin();
	let mut reader = stdin.lock();
	let abc : Vec<i32>= read_row_vec(&mut reader);
	let [a,b,c] = abc[..] else { panic!() };

	let ans = solve(a,b,c);
	println!("{}", ans);
}
