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

fn read_line(reader: &mut std::io::StdinLock) -> String {
    let mut buf = String::new();
    reader.read_line(&mut buf).unwrap();
    buf.trim().to_string()
}

fn cmd_n(v: Vec<i32>) -> Vec<i32> {
    let mut w = vec![0; 6];
    w[0] = v[1];
    w[1] = v[5];
    w[2] = v[2];
    w[3] = v[3];
    w[4] = v[0];
    w[5] = v[4];
    w
}
fn cmd_e(v: Vec<i32>) -> Vec<i32> {
    let mut w = vec![0; 6];
    w[0] = v[3];
    w[1] = v[1];
    w[2] = v[0];
    w[3] = v[5];
    w[4] = v[4];
    w[5] = v[2];
    w
}
fn cmd_w(v: Vec<i32>) -> Vec<i32> {
    let mut w = vec![0; 6];
    w[0] = v[2];
    w[1] = v[1];
    w[2] = v[5];
    w[3] = v[0];
    w[4] = v[4];
    w[5] = v[3];
    w
}
fn cmd_s(v: Vec<i32>) -> Vec<i32> {
    let mut w = vec![0; 6];
    w[0] = v[4];
    w[1] = v[0];
    w[2] = v[2];
    w[3] = v[3];
    w[4] = v[5];
    w[5] = v[1];
    w
}

fn main() {
    let reader = std::io::stdin();

    let mut v = read_row_vec::<i32>(&mut reader.lock());
    let c = read_line(&mut reader.lock());

    c.chars().for_each(|x| match x {
        'N' => v = cmd_n(v.clone()),
        'E' => v = cmd_e(v.clone()),
        'W' => v = cmd_w(v.clone()),
        'S' => v = cmd_s(v.clone()),
        _ => {}
    });
    println!("{}", v[0]);
}
