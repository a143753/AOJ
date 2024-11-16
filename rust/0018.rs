use std::io::prelude::*;
use std::str::FromStr;

fn main() {
    let stdin = std::io::stdin();

    let l = stdin.lock().lines().next().unwrap().unwrap();
    let mut d : Vec<i32> = l.split_whitespace().map(|x| i32::from_str(x).unwrap()).collect();
    d.sort_by(|a,b| b.cmp(a));
    let s : String = d.iter().map(|x| x.to_string()).collect::<Vec<_>>().join(" ");
    println!("{}",s);
}
