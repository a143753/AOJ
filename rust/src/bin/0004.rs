use std::io::prelude::*;
use std::str::FromStr;

fn ans( i : Vec<f64> ) -> (f64,f64) {
    let (a,b,c,d,e,f) = (i[0],i[1],i[2],i[3],i[4],i[5]);

    let x = ( (c*e - b*f) / (a*e - b*d) * 1000.0).round() / 1000.0;
    let y = ( (c*d - a*f) / (b*d - a*e) * 1000.0).round() / 1000.0;

    (x,y)
}

fn main() {
    let reader = std::io::stdin();

    reader.lock().lines().for_each(|line|{
        let d : Vec<f64> = line.unwrap().split_whitespace().map(|x| f64::from_str(x).unwrap()).collect();
        let (x,y) = ans(d);
        println!("{:.3} {:.3}",x,y);
    })
}
