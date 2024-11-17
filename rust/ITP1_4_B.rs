use std::f64::consts::PI;
fn main() {
    let mut buf = String::new();
    std::io::stdin().read_line(&mut buf).unwrap();

    let dt = buf.trim().parse::<f64>().unwrap();

    println!("{:.6} {:.6}", dt * dt * PI, dt * 2.0 * PI);
}
