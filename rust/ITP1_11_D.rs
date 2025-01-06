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
fn read_matrix<T: std::str::FromStr>(reader: &mut std::io::StdinLock, n: usize) -> Vec<Vec<T>>
where
    <T as std::str::FromStr>::Err: std::fmt::Debug,
{
    let mut matrix = Vec::new();
    reader.lines().take(n as usize).for_each(|line| {
        let dt = line
            .unwrap()
            .split_whitespace()
            .map(|x| x.parse::<T>().unwrap())
            .collect::<Vec<_>>();
        matrix.push(dt);
    });
    matrix
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

fn g(v1: Vec<i32>, v2: Vec<i32>) -> bool {
    let c1s = ["I", "N", "E", "W", "S", "NN"];
    let c2s = ["I", "C", "CC", "CCC"];

    for c1 in c1s.iter() {
        let w1 = f(v1.clone(), c1.to_string());
        for c2 in c2s.iter() {
            let w2 = f(w1.clone(), c2.to_string());
            if w2 == v2 {
                return true; // 一致する
            }
        }
    }
    return false; // 一致しない
}

fn h(vs: Vec<Vec<i32>>) -> bool {
    let n = vs.len();

    for i in 0..n {
        for j in i + 1..n {
            if g(vs[i].clone(), vs[j].clone()) {
                return true; // 一致するものがある
            }
        }
    }
    return false; // 全て一致しない
}

fn main() {
    let reader = std::io::stdin();

    let n = read_scalar::<i32>(&mut reader.lock());
    let vs = read_matrix::<i32>(&mut reader.lock(), n as usize);

    let ans = h(vs);
    if !ans {
        println!("Yes");
    } else {
        println!("No");
    }
}
