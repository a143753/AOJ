use std::io::BufRead;

fn read_line(reader: &mut std::io::StdinLock) -> String {
    let mut buf = String::new();
    reader.read_line(&mut buf).unwrap();
    buf.trim().to_string()
}

fn read_line_words(reader: &mut std::io::StdinLock) -> Vec<String> {
    let mut buf = String::new();
    reader.read_line(&mut buf).unwrap();
    buf.split_whitespace().map(|x| x.to_string()).collect()
}

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
    let mut w = read_line(&mut reader.lock());
    let n = read_scalar::<i32>(&mut reader.lock());

    for _ in 0..n {
        let ws = read_line_words(&mut reader.lock());
        let c = &ws[0];
        let a = ws[1].parse::<usize>().unwrap();
        let b = ws[2].parse::<usize>().unwrap();

        match c.as_str() {
            "print" => {
                let s = &w[a..b + 1];
                println!("{}", s);
            }
            "reverse" => {
                let mut s = w.as_str()[a..b + 1].to_string();
                s = s.chars().rev().collect();
                w = w[..a].to_string() + &s + &w[b + 1..];
            }
            "replace" => {
                let p = &ws[3];
                w = w[..a].to_string() + p + &w[b + 1..];
            }
            &_ => {}
        }
    }
}
