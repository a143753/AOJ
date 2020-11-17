use std::io::prelude::*;

fn ans(x:i32) -> i32 {
    let mut s = 0;
    for a in 0..10 {
        for b in 0..10 {
            let ab = a + b;
            if ab > x {
                break;
            }
            for c in 0..10 {
                let abc = ab + c;
                if abc > x {
                    break;
                }
                let d = x - abc;
                if d < 10 {
                    //println!("{} {} {} {}", a, b, c, d);
                    s = s + 1;
                }
            }
        }
    }
    s
}

fn main() {
    let stdin = std::io::stdin();

    for line in stdin.lock().lines() {
        let d : i32 = line.unwrap().parse().unwrap();
        let a = ans(d);
        println!("{:?}",a)
    }
}
