use std::io::BufRead;

fn main() {
    let reader = std::io::stdin();

    let mut nm = Vec::new();
    reader.lock().lines().take(1).for_each(|line| {
        nm = line
            .unwrap()
            .split_whitespace()
            .map(|x| x.parse::<i32>().unwrap())
            .collect();
    });
    let n = nm[0];
    let _m = nm[1];

    let mut array = Vec::new();
    reader.lock().lines().take(n as usize).for_each(|line| {
        let dt = line
            .unwrap()
            .split_whitespace()
            .map(|x| x.parse::<i32>().unwrap())
            .collect::<Vec<_>>();
        array.push(dt);
    });

    let mut ij = Vec::new();
    reader.lock().lines().take(2).for_each(|line| {
        let dt = line
            .unwrap()
            .split_whitespace()
            .map(|x| x.parse::<i32>().unwrap())
            .collect::<Vec<_>>();
        ij.push(dt);
    });
    let i1 = ij[0][0];
    let j1 = ij[0][1];
    let i2 = ij[1][0];
    let j2 = ij[1][1];

    (i1..=i2).for_each(|i| {
        (j1..=j2).for_each(|j| {
            print!("{} ", array[i as usize][j as usize]);
        });
        println!();
    });
}
