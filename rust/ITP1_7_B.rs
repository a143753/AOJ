use std::io::BufRead;

fn ans(n: &i32, x: &i32) -> i32 {
    let mut cnt = 0;
    for i in 1..*n + 1 {
        for j in i + 1..*n + 1 {
            for k in j + 1..*n + 1 {
                if i + j + k == *x {
                    cnt += 1;
                }
            }
        }
    }
    cnt
}

fn main() {
    let mut idt = Vec::new();

    std::io::stdin().lock().lines().for_each(|line| {
        let v: Vec<i32> = line
            .unwrap()
            .trim()
            .split_whitespace()
            .map(|x| x.parse().unwrap())
            .collect();

        idt.push((v[0], v[1]));
    });

    let odt: Vec<i32> = idt
        .iter()
        .take_while(|(x, y)| *x != 0 || *y != 0)
        .map(|(x, y)| ans(x, y))
        .collect::<Vec<i32>>();

    odt.iter().for_each(|x| println!("{}", x));
}
