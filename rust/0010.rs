use std::io::prelude::*;
use std::str::FromStr;

fn ans(i:Vec<f64>) -> (f64,f64,f64) {
    let x1 = i[0];
    let y1 = i[1];
    let x2 = i[2];
    let y2 = i[3];
    let x3 = i[4];
    let y3 = i[5];

    let a2 = x1.powf(2.0) - x2.powf(2.0);
    let b2 = 2.0 * (x1-x2);
    let c2 = y1.powf(2.0) - y2.powf(2.0);
    let d2 = 2.0 * (y1-y2);
    let a3 = x1.powf(2.0) - x3.powf(2.0);
    let b3 = 2.0 * (x1-x3);
    let c3 = y1.powf(2.0) - y3.powf(2.0);
    let d3 = 2.0 * (y1-y3);

    let xp = (a2*d3 + c2*d3 - a3*d2 - c3*d2) / (b2*d3 - b3*d2);
    let yp = if d2 != 0.0 {
                (a2+c2 - b2*xp) / d2
             } else {
                 (a3+c3-b3*xp) / d3
             };
    let r = ( (x1-xp).powf(2.0) + (y1-yp).powf(2.0) ).sqrt(); 
    (xp, yp, r)
}

fn main() {
    let reader = std::io::stdin();

    let l = reader.lock().lines().next().unwrap().unwrap();
    let n = usize::from_str(&l).unwrap();

    reader.lock().lines().take(n).for_each(|line| {
	let d : Vec<f64> = line.unwrap().split_whitespace().map(|x| f64::from_str(x).unwrap()).collect();
	let (x,y,r) = ans(d);
	println!("{:.3} {:.3} {:.3}",x,y,r);
    });

}
