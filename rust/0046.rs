use std::io::BufRead;

fn read_col_vec<T: std::str::FromStr>(reader: &mut std::io::StdinLock, n: usize) -> Vec<T>
where
    <T as std::str::FromStr>::Err: std::fmt::Debug,
{
    let mut col = Vec::new();
    if n == 0 {
        reader.lines().for_each(|line| {
            let d = line.unwrap().parse::<T>().unwrap();
            col.push(d);
        });
    } else {
        reader.lines().take(n as usize).for_each(|line| {
            let d = line.unwrap().parse::<T>().unwrap();
            col.push(d);
        });
    }
    col
}

fn main() {
    let reader = std::io::stdin();
    let d = read_col_vec::<f64>(&mut reader.lock(), 0);

    let max = d.iter().fold(0.0 / 0.0, |a, b| b.max(a));
    let min = d.iter().fold(0.0 / 0.0, |a, b| b.min(a));

    println!("{}", max - min);
}
