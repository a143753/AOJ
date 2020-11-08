use std::io::prelude::*;
use std::str::FromStr;

fn ans( i : Vec<f64> ) -> (f64,f64) {
    let a = i[0];
    let b = i[1];
    let c = i[2];
    let d = i[3];
    let e = i[4];
    let f = i[5];

    let x = ( (c*e - b*f) / (a*e - b*d) * 1000.0).round() / 1000.0;
    let y = ( (c*d - a*f) / (b*d - a*e) * 1000.0).round() / 1000.0;

    (x,y)
}

fn main() {
    let stdin = std::io::stdin();

    for line in stdin.lock().lines() {
        let d : Vec<f64> = line.unwrap().split_whitespace().map(|x| f64::from_str(x).unwrap()).collect();
        let (x,y) = ans(d);
        println!("{:.3} {:.3}",x,y);
    }
}
