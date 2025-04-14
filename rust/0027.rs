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

fn days_of_month(m: i32) -> i32 {
	match m {
		1 => 31,
		2 => 29,
		3 => 31,
		4 => 30,
		5 => 31,
		6 => 30,
		7 => 31,
		8 => 31,
		9 => 30,
		10 => 31,
		11 => 30,
		_ => panic!("Invalid month"),
	}
}

fn ans(m:i32,d:i32) -> String {
	let mut days = d + 3;
	for i in 1..m {
		days += days_of_month(i);
	}

	match days % 7 {
		0 => "Sunday".to_string(),
		1 => "Monday".to_string(),
		2 => "Tuesday".to_string(),
		3 => "Wednesday".to_string(),
		4 => "Thursday".to_string(),
		5 => "Friday".to_string(),
		_ => "Saturday".to_string(),
	}
	
}

fn main() {
    let reader = std::io::stdin();
    let mut reader = reader.lock();

	loop {
		let md: Vec<i32> = read_row_vec(&mut reader);
		let m = md[0];
		let d = md[1];

		if m == 0 && d == 0 {
			break;
		}

		let a = ans(m, d);
		println!("{}", a);
	}
}
