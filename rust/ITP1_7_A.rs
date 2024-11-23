use std::io::BufRead;

fn ans(dt: Vec<(i32, i32, i32)>) {
    for (m, f, r) in dt {
        if m == -1 && f == -1 && r == -1 {
            break;
        }
        if m == -1 || f == -1 {
            println!("F");
        } else if m + f >= 80 {
            println!("A");
        } else if m + f >= 65 {
            println!("B");
        } else if m + f >= 50 {
            println!("C");
        } else if m + f >= 30 {
            if r >= 50 {
                println!("C");
            } else {
                println!("D");
            }
        } else {
            println!("F");
        }
    }
}

fn main() {
    let mut dt = Vec::new();
    std::io::stdin().lock().lines().for_each(|line| {
        let v: Vec<i32> = line
            .unwrap()
            .trim()
            .split_whitespace()
            .map(|x| x.parse().unwrap())
            .collect();
        let (m, f, r) = (v[0], v[1], v[2]);

        dt.push((m, f, r));
    });

    ans(dt);
}
