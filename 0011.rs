use std::io::prelude::*;
use std::str::FromStr;

fn ans(mut t:Vec<i32>,i:Vec<(i32,i32)>) -> Vec<i32> {
    for ii in i {
        let a : usize = ii.0 as usize;
        let b : usize = ii.1 as usize;
        let s  = t[a-1];
        t[a-1] = t[b-1];
        t[b-1] = s;
    }
    t
}

fn main() {
    let stdin = std::io::stdin();
    let mut lines = stdin.lock().lines();
    
    let mut wn : Vec<i32> = Vec::new();

    for _ in 0..2 {
        let l = lines.next().unwrap().unwrap();
        wn.push(i32::from_str(&l).unwrap());
    }

    let t : Vec<i32> = (1..wn[0]+1).collect();
    let mut i : Vec<(i32,i32)> = Vec::new();

    for _ in 0 .. wn[1] {
        let d : Vec<i32> = lines.next().unwrap().unwrap().split(',').map(|x| i32::from_str(x).unwrap()).collect();
        i.push( (d[0],d[1]) );
    }

    let o = ans(t,i);
    for oo in o.iter() {
        println!("{}",oo);
    }
}
