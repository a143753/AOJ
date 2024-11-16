use std::io::prelude::*;
use std::str::FromStr;

fn ans(d: Vec<i32>) -> Vec<i32> {
    let mut s: Vec<i32> = Vec::new();
    let mut a: Vec<i32> = Vec::new();

    d.iter().for_each(|e| {
        if *e == 0 {
            let o = s.pop();
            a.push(o.unwrap());
        } else {
            s.push(*e);
        }
    });
    return a;
}

fn main() {
    let reader = std::io::stdin();
    let d: Vec<i32> = reader
        .lock()
        .lines()
        .map(|line| i32::from_str(&line.unwrap()).unwrap())
        .collect();

    let a = ans(d);

    a.iter().for_each(|e| {
        println!("{}", e);
    });
}
