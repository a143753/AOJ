use std::io::prelude::*;
use std::str::FromStr;

fn ans(d:i32,s:&mut Vec<i32>) {
    if d == 0 {
        let o = s.pop();
        println!("{}",o.unwrap());
    } else {
        s.push(d);
    }
}

fn main() {
    let stdin = std::io::stdin();
    let mut s : Vec<i32> = Vec::new();
    for line in stdin.lock().lines() {
        let d = i32::from_str(&line.unwrap()).unwrap();
        ans(d,&mut s);
    }
}
