use std::io::prelude::*;
use std::str::FromStr;

fn f(x:i32) -> i32 {
    x*x
}

fn ans(d:i32) -> i32 {
    let mut s = 0;

    for i in 0..(600/d) {
        let h = f(i*d);
        s = s + h*d;
    }
    s
}

fn main() {
    let stdin = std::io::stdin();
    for line in stdin.lock().lines() {
        let d = i32::from_str(&line.unwrap()).unwrap();
        let o = ans(d);
        println!("{}",o);
    }
}
