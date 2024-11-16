use std::io::prelude::*;
use std::str::FromStr;

fn f(x: i32) -> i32 {
    x * x
}

fn ans(d: i32) -> i32 {
    let mut s = 0;

    for i in 0..(600 / d) {
        let h = f(i * d);
        s = s + h * d;
    }
    s
}

fn main() {
    let reader = std::io::stdin();

    let i: Vec<i32> = reader
        .lock()
        .lines()
        .map(|line| i32::from_str(&line.unwrap()).unwrap())
        .map(|d| ans(d))
        .collect();

    i.iter().for_each(|e| {
        println!("{}", e);
    });
}
