use std::f64::consts::PI;
use std::io::BufRead;

fn read_matrix<T: std::str::FromStr>(reader: &mut std::io::StdinLock, n: usize) -> Vec<Vec<T>>
where
    <T as std::str::FromStr>::Err: std::fmt::Debug,
{
    let mut matrix = Vec::new();
    if n == 0 {
        reader.lines().for_each(|line| {
            let dt = line
                .unwrap()
                .split(',')
                .map(|x| x.parse::<T>().unwrap())
                .collect::<Vec<_>>();
            matrix.push(dt);
        });
    } else {
        reader.lines().take(n as usize).for_each(|line| {
            let dt = line
                .unwrap()
                .split(',')
                .map(|x| x.parse::<T>().unwrap())
                .collect::<Vec<_>>();
            matrix.push(dt);
        });
    }
    matrix
}

fn f(v: Vec<Vec<f64>>) -> (i32, i32) {
    let mut x: f64 = 0.0;
    let mut y: f64 = 0.0;
    let mut a: f64 = 0.0;

    for i in 0..v.len() {
        if v[i][0] == 0.0 && v[i][1] == 0.0 {
            break;
        }

        let len = v[i][0];
        x += len * f64::cos(a / 180.0 * PI);
        y += len * f64::sin(a / 180.0 * PI);

        a += v[i][1];
    }
    let xx = if x > 0.0 { x.floor() } else { x.ceil() } as i32;
    let yy = if y > 0.0 { y.floor() } else { y.ceil() } as i32;
    (yy, xx)
}

fn main() {
    let reader = std::io::stdin();
    let n = read_matrix::<f64>(&mut reader.lock(), 0);

    let (y, x) = f(n);
    println!("{}", y);
    println!("{}", x);
}
