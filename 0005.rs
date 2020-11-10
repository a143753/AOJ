use std::io::prelude::*;
use std::str::FromStr;

fn max(a:i32,b:i32) -> (i32,i32) {
    if a >= b {
        (a,b)
    } else {
        (b,a)
    }
}

fn gcd(a:i32,b:i32) -> i32 {
    let r = a % b;
    if r == 0 {
        b
    } else {
        gcd(b,r)
    }
}

fn ans( i : Vec<i32> ) -> (i32,i32) {
    let (a,b) = max(i[0],i[1]);
    let x = gcd(a,b);
    let y = (a/x) * (b/x) * x;
    (x,y)
}

fn main() {
    let stdin = std::io::stdin();

    for line in stdin.lock().lines() {
        let d : Vec<i32> = line.unwrap().split_whitespace().map(|x| i32::from_str(x).unwrap()).collect();
        let (x,y) = ans(d);
        println!("{:.3} {:.3}",x,y);
    }
}
