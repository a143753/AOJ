use std::io::prelude::*;
use std::str::FromStr;

fn ans(n:i32) -> i32 {
    let mut s:f64 = 100000.0;

    for _ in 0..n {
        s = (s * 1.05 / 1000.0).ceil() * 1000.0;
    }
    s as i32
}

fn main() {
    let stdin = std::io::stdin();

    let l = stdin.lock().lines().next().unwrap().unwrap();
    let n = i32::from_str(&l).unwrap();
    let a = ans(n); 
   
    println!("{}",a);
}
