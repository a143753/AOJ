use std::io::prelude::*;
use std::str::FromStr;

fn gcd(a:i32,b:i32) -> i32 {
    let r = a % b;
    if r == 0 {
        b
    } else {
        gcd(b,r)
    }
}
fn ans( i : Vec<i32> ) -> (i32,i32) {
    let x = gcd(i[0],i[1]);
    let y = (i[0]/x) * (i[1]/x) * x;
    (x,y)
}

fn main() {
    let reader = std::io::stdin();

    reader.lock().lines().for_each(|line|{
        let d : Vec<i32> = line.unwrap().split_whitespace().map(|x| i32::from_str(x).unwrap()).collect();
        let (x,y) = ans(d);
        println!("{} {}",x,y);
    })
}
