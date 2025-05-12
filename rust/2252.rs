use std::io::BufRead;

fn read_line(reader: &mut std::io::StdinLock) -> String {
    let mut buf = String::new();
    reader.read_line(&mut buf).unwrap();
    buf.trim().to_string()
}

fn ans(line: String) {
	
	let left = ['q', 'w', 'e', 'r', 't',
				'a', 's', 'd', 'f', 'g',
				'z', 'x', 'c', 'v', 'b'];

	let c = line.chars().collect::<Vec<_>>()[0];
	// flag := true->左、false->右
	let mut flag = if left.contains(&c) {
		true
	} else {
		false
	};
	let mut cnt = 0;

	line.chars().for_each(|c| {
		if flag {
			if left.contains(&c) {
			} else {
				cnt += 1;
				flag = false;
			}
		} else {
			if left.contains(&c) {
				flag = true;
				cnt += 1;
			} else {
			}
		}
	});
	println!("{}", cnt);
}

fn main() {
	let mut reader = std::io::stdin().lock();

	loop {
		let line = read_line(&mut reader);
		if line == "#" {
			break;
		} else {
			ans(line);
		}
	}
}
