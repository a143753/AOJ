use std::io::prelude::*;
use std::str::FromStr;

fn ans(mut t: Vec<i32>, i: Vec<(i32, i32)>) -> Vec<i32> {
    for ii in i {
        let a: usize = ii.0 as usize;
        let b: usize = ii.1 as usize;
        let s = t[a - 1];
        t[a - 1] = t[b - 1];
        t[b - 1] = s;
    }
    t
}

fn main() {
    let reader = std::io::stdin();

    let wn: Vec<i32> = reader
        .lock()
        .lines()
        .take(2)
        .map(|e| i32::from_str(&e.unwrap()).unwrap())
        .collect();

    let t: Vec<i32> = (1..wn[0] + 1).collect();

    let mut i: Vec<(i32, i32)> = Vec::new();
    reader.lock().lines().take(wn[1] as usize).for_each(|line| {
        let d: Vec<i32> = line
            .unwrap()
            .split(',')
            .map(|x| i32::from_str(x).unwrap())
            .collect();
        i.push((d[0], d[1]));
    });

    let o = ans(t, i);
    o.iter().for_each(|e| {
        println!("{}", e);
    })
}
