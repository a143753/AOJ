use std::io::BufRead;

fn mult(a: &Vec<Vec<i32>>, b: &Vec<i32>) -> Vec<i32> {
    let mut c = vec![0; a.len()];
    for i in 0..a.len() {
        for j in 0..b.len() {
            c[i] += a[i][j] * b[j];
        }
    }
    c
}

fn main() {
    let mut buf = String::new();

    std::io::stdin().read_line(&mut buf).unwrap();
    let nm = buf
        .trim()
        .split_whitespace()
        .map(|x| x.parse::<i32>().unwrap())
        .collect::<Vec<_>>();
    let n = nm[0] as usize;
    let m = nm[1] as usize;

    let mut a = vec![vec![0; m]; n];
    let mut b = vec![0; m];

    std::io::stdin()
        .lock()
        .lines()
        .take(n)
        .enumerate()
        .for_each(|(i, line)| {
            let t = line
                .unwrap()
                .trim()
                .split_whitespace()
                .map(|x| x.parse::<i32>().unwrap())
                .collect::<Vec<_>>();

            for j in 0..m {
                a[i][j] = t[j];
            }
        });
    // println!("{:?}", a);

    std::io::stdin()
        .lock()
        .lines()
        .take(m)
        .enumerate()
        .for_each(|(i, line)| {
            let t = line.unwrap().trim().parse::<i32>().unwrap();
            b[i] = t
        });

    // println!("{:?}", b);

    let c = mult(&a, &b);

    for i in 0..n {
        println!("{}", c[i]);
    }
}
