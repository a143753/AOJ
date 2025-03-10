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
	let d = read_scalar::<i32>(&mut reader.lock());

	if d >= 65 && d <= 90 {
		println!("1"); // 大文字
	} else if d >= 97 && d <= 122 {
		println!("2"); // 小文字
	} else {
		println!("0"); // それ以外
	}
}

		
