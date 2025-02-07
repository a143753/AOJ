use std::io::BufRead;
use std::str::FromStr;

fn read_matrix<T: std::str::FromStr>(
    reader: &mut std::io::StdinLock,
    n: usize,
    s: char,
) -> Vec<Vec<T>>
where
    <T as std::str::FromStr>::Err: std::fmt::Debug,
{
    fn sub<T: std::str::FromStr>(line: &str, s: char) -> Vec<T>
    where
        <T as FromStr>::Err: std::fmt::Debug,
    {
        if s == ' ' {
            line.split_whitespace()
                .map(|x| x.parse::<T>().unwrap())
                .collect::<Vec<_>>()
        } else {
            line.split(s)
                .map(|x| x.parse::<T>().unwrap())
                .collect::<Vec<_>>()
        }
    }

    let mut matrix = Vec::new();
    if n == 0 {
        reader.lines().for_each(|line| {
            let dt = sub::<T>(&line.unwrap(), s);
            matrix.push(dt);
        });
    } else {
        reader.lines().take(n as usize).for_each(|line| {
            let dt = sub::<T>(&line.unwrap(), s);
            matrix.push(dt);
        });
    }
    matrix
}

fn f(x: &Vec<i32>, y: &Vec<i32>) -> (i32, i32) {
    let mut h = 0;
    let mut b = 0;
    for i in 0..x.len() {
        for j in 0..y.len() {
            if x[i] == y[j] {
                if i == j {
                    h += 1;
                } else {
                    b += 1;
                }
            }
        }
    }
    (h, b)
}

fn main() {
    let reader = std::io::stdin();
    let d = read_matrix::<i32>(&mut reader.lock(), 0, ' ');

    for i in (0..d.len()).step_by(2) {
        let (h, b) = f(&d[i], &d[i + 1]);
        println!("{} {}", h, b);
    }
}
