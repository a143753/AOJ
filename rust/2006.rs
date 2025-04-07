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

fn read_line(reader: &mut std::io::StdinLock) -> String {
    let mut buf = String::new();
    reader.read_line(&mut buf).unwrap();
    buf.trim().to_string()
}

fn pr(buf: (u32, u32)) {
	let idx = buf.1 as usize;
	match buf.0 {
		0 => print!(""),
	 	1 => print!("{}",[".", ",", "!", "?", " "][idx % 5]),
	 	2 => print!("{}",["a", "b", "c"          ][idx % 3]),
	 	3 => print!("{}",["d", "e", "f"          ][idx % 3]),
	 	4 => print!("{}",["g", "h", "i"          ][idx % 3]),
	 	5 => print!("{}",["j", "k", "l"          ][idx % 3]),
	 	6 => print!("{}",["m", "n", "o"          ][idx % 3]),
	 	7 => print!("{}",["p", "q", "r", "s"     ][idx % 4]),
	 	8 => print!("{}",["t", "u", "v"          ][idx % 3]),
	 	9 => print!("{}",["w", "x", "y", "z"     ][idx % 4]),
	 	_ => {}
	}

}

fn ans(i: Vec<u32> ){
	let mut buf = (0,0);
	
	for d in i {

		match d {
			0 => {
				pr(buf);
				buf= (0,0);
			}
			n => if buf.0 != n {
				buf = (n,0);
			} else {
				buf.1 += 1;
			}
		}
		
	}
	println!();
	
}


fn main() {
	let stdin = std::io::stdin();
	let mut reader = stdin.lock();

	// Read the first line
	let n: usize = read_scalar(&mut reader);

	for _ in 0..n {
		let l0 = read_line(&mut reader);
		
		let l1 = l0.chars()
			.map(|c| c.to_digit(10).unwrap())
			.collect::<Vec<_>>();
		ans(l1);
	}

}
