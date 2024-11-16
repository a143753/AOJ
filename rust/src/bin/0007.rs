use std::io::prelude::*;

fn ans(n:i32) -> i32 {
    (0..n).fold(100000, |s, _| (s as f64 * 1.05 / 1000.0).ceil() as i32 * 1000)
}

fn main() {
    let n = std::io::stdin().lock().lines().next().unwrap().unwrap().parse().unwrap();
    let a = ans(n); 
    println!("{}",a);
}
