use std::cmp::Ordering::{Less, Greater};

fn ans(s: &str) -> String {
	let mut s1 :Vec<char> = s.chars().collect();
	s1.sort_by(|a, b|
			   if a.is_lowercase() {
				   if b.is_lowercase() {
					   a.cmp(b)
				   } else {
					   Less
				   }
			   } else if a.is_uppercase() {
				   if b.is_lowercase() {
					   Greater
				   } else if b.is_uppercase() {
					   a.cmp(b)
				   } else {
					   Less
				   }
			   } else {
				   if b.is_lowercase() || b.is_uppercase() {
					   Greater
				   } else {
					   a.cmp(b)
				   }
			   });
	s1.iter().collect()
}

fn main() {
	let reader = std::io::stdin();
	let mut buf = String::new();

	while reader.read_line(&mut buf).unwrap() > 0 {
		if buf.trim() == "#" {
			break;
		}
		let o = ans( buf.trim());
		println!("{}", o);
		buf.clear();
	}
}
