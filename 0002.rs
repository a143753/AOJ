use std::io::prelude::*;
use std::str::FromStr;

fn parse( s : String ) -> (i32,i32) {
    let d : Vec<i32> = s.split_whitespace().map(|x| i32::from_str(x).unwrap()).collect();
    (d[0],d[1])
}

fn ans( a:i32, b:i32 ) -> i32 {
    let mut s = a + b;
    let mut n = 1;
    while s >= 10 {
        s = s / 10;
        n = n + 1;
    }
    n
}

fn main() {
    let reader = std::io::stdin();

    for line in reader.lock().lines() {
        let (a,b) = parse(line.unwrap());
        let n = ans(a,b);
        println!("{:?}",n);
    }
}
