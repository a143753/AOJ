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

fn ans( x : f64 ) -> String {
	if x <= 48.00 {
		return "light fly".to_string();
	} else if x <= 51.00 {
		return "fly".to_string();
	} else if x <= 54.00 {
		return "bantam".to_string();
	} else if x <= 57.00 {
		return "feather".to_string();
	} else if x <= 60.00 {
		return "light".to_string();
	} else if x <= 64.00 {
		return "light welter".to_string();
	} else if x <= 69.00 {
		return "welter".to_string();
	} else if x <= 75.00 {
		return "light middle".to_string();
	} else if x <= 81.00 {
		return "middle".to_string();
	} else if x <= 91.00 {
		return "light heavy".to_string();
	} else {
		return "heavy".to_string();
	}
}

fn main() {
	let stdin = std::io::stdin();
	let mut reader = stdin.lock();
	
	// 標準入力から1行読み取り、f64に変換
	let x: Vec<f64> = read_col_vec(&mut reader, 0 );

	x.iter()
		.map(|&x| ans(x))
		.for_each(|s| println!("{}", s));
}
