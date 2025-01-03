use std::io::BufRead;

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

fn main() {
    let reader = std::io::stdin();
    let v = read_row_vec::<f64>(&mut reader.lock());
    let a = v[0];
    let b = v[1];
    let c = v[2];

    let s = a * b * c.to_radians().sin() * 0.5;
    let l = a + b + (a.powi(2) + b.powi(2) - 2.0 * a * b * c.to_radians().cos()).sqrt();
    let h = s / a * 2.0;
    println!("{}", s);
    println!("{}", l);
    println!("{}", h);
}
