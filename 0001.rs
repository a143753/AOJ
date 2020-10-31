fn read_input() -> Vec<i32> {
    let mut a : Vec<i32> = Vec::new();
    for _ in 0..10 {
        let mut s = String::new();
        std::io::stdin().read_line(&mut s).ok();
        let ss = s.trim().parse().expect("nan");
        a.push(ss);
    }
    a
}

fn main() {
    let mut a = read_input();
    a.sort_by(|a,b| b.cmp(a));
    for i in 0..3 {
        println!("{}",a[i]);
    }
}

