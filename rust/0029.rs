use std::io::BufRead;
use std::collections::HashMap;

fn read_line_words(reader: &mut std::io::StdinLock) -> Vec<String> {
    let mut buf = String::new();
    reader.read_line(&mut buf).unwrap();
    buf.split_whitespace().map(|x| x.to_string()).collect()
}

fn main () {
	let stdin = std::io::stdin();
	let mut reader = stdin.lock();

	let s: Vec<String> = read_line_words(&mut reader);
	let mut tl = HashMap::new();
	let mut tn = HashMap::new();

	s.iter().for_each(|x| {
		let l = x.len();
		tl.insert(x.clone(), l);
		*tn.entry(x).or_insert(0) += 1;

	});

	let mut vl : Vec<(&String, &usize)> = tl.iter().collect();
	vl.sort_by(|a, b| b.1.cmp(a.1));
	
	let mut vn : Vec<(&&String, &i32)> = tn.iter().collect();
	vn.sort_by(|a, b| b.1.cmp(a.1));

	println!("{} {}",vn[0].0,vl[0].0);
}
