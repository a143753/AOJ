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

fn cmd_i(v: Vec<i32>) -> Vec<i32> {
    [v[0], v[1], v[2], v[3], v[4], v[5]].to_vec()
}
fn cmd_n(v: Vec<i32>) -> Vec<i32> {
    [v[1], v[5], v[2], v[3], v[0], v[4]].to_vec()
}
fn cmd_e(v: Vec<i32>) -> Vec<i32> {
    [v[3], v[1], v[0], v[5], v[4], v[2]].to_vec()
}
fn cmd_w(v: Vec<i32>) -> Vec<i32> {
    [v[2], v[1], v[5], v[0], v[4], v[3]].to_vec()
}
fn cmd_s(v: Vec<i32>) -> Vec<i32> {
    [v[4], v[0], v[2], v[3], v[5], v[1]].to_vec()
}
fn cmd_c(v: Vec<i32>) -> Vec<i32> {
    [v[0], v[2], v[4], v[1], v[3], v[5]].to_vec()
}

fn f(v: Vec<i32>, cmd: String) -> Vec<i32> {
    let mut w = v.clone();
    for c in cmd.chars() {
        match c.to_string().as_str() {
            "I" => w = cmd_i(w),
            "N" => w = cmd_n(w),
            "E" => w = cmd_e(w),
            "W" => w = cmd_w(w),
            "S" => w = cmd_s(w),
            "C" => w = cmd_c(w),
            _ => (),
        }
    }
    w
}

fn g(v1: Vec<i32>, v2: Vec<i32>) {
    let c1s = ["I", "N", "E", "W", "S", "NN"];
    let c2s = ["I", "C", "CC", "CCC"];

    for c1 in c1s.iter() {
        let w1 = f(v1.clone(), c1.to_string());
        for c2 in c2s.iter() {
            let w2 = f(w1.clone(), c2.to_string());
            if w2 == v2 {
                println!("Yes");
                return;
            }
        }
    }
    println!("No");
}

fn main() {
    let reader = std::io::stdin();

    let v1 = read_row_vec::<i32>(&mut reader.lock());
    let v2 = read_row_vec::<i32>(&mut reader.lock());

    g(v1, v2);
}
