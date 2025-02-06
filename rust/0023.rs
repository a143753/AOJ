use std::io::BufRead;

fn read_scalar<T: std::str::FromStr>(reader: &mut std::io::StdinLock) -> T
where
    <T as std::str::FromStr>::Err: std::fmt::Debug,
{
    let mut scalar = None;
    reader.lines().take(1).for_each(|line| {
        scalar = Some(line.unwrap().parse::<T>().unwrap());
    });
    scalar.unwrap()
}
fn read_row_vec<T: std::str::FromStr>(reader: &mut std::io::StdinLock) -> Vec<T>
where
    <T as std::str::FromStr>::Err: std::fmt::Debug,
{
    let mut row = Vec::new();
    reader.lines().take(1).for_each(|line| {
        row = line
            .unwrap()
            .split_whitespace()
            .map(|x| x.parse::<T>().unwrap())
            .collect::<Vec<_>>();
    });
    row
}

fn f(xa: f64, ya: f64, ra: f64, xb: f64, yb: f64, rb: f64) -> i32 {
    let d = ((xa - xb).powi(2) + (ya - yb).powi(2)).sqrt();
    if d > ra + rb {
        0
    } else if d + rb < ra {
        2
    } else if d + ra < rb {
        -2
    } else {
        1
    }
}

fn main() {
    let reader = std::io::stdin();
    let n = read_scalar::<i32>(&mut reader.lock());

    for _ in 0..n as usize {
        let v = read_row_vec::<f64>(&mut reader.lock());
        let a = f(v[0], v[1], v[2], v[3], v[4], v[5]);
        println!("{}", a);
    }
}
