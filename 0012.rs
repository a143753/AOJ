use std::io::prelude::*;
use std::str::FromStr;

fn chk(x1:f64,y1:f64,x2:f64,y2:f64,xp:f64,yp:f64,xq:f64,yq:f64) -> bool {
    let dp = (y2-y1) / (x2-x1) * (xp-x1) + y1 - yp;
    let dq = (y2-y1) / (x2-x1) * (xq-x1) + y1 - yq;

    (dp*dq) >= 0.0
}

fn ans(i:Vec<f64>) -> String {
    let x1 = i[0];
    let y1 = i[1];
    let x2 = i[2];
    let y2 = i[3];
    let x3 = i[4];
    let y3 = i[5];
    let xp = i[6];
    let yp = i[7];

    let c1 = chk(x1,y1,x2,y2,x3,y3,xp,yp);
    let c2 = chk(x2,y2,x3,y3,x1,y1,xp,yp);
    let c3 = chk(x3,y3,x1,y1,x2,y2,xp,yp);

    if c1 && c2 && c3 {
        "YES".to_string()
    } else {
        "NO".to_string()
    }
}

fn main() {
    let stdin = std::io::stdin();

    for line in stdin.lock().lines() {
        let d : Vec<f64> = line.unwrap().split_whitespace().map(|x| f64::from_str(x).unwrap()).collect();
        let o = ans(d);
        println!("{}",o);
    }
}
