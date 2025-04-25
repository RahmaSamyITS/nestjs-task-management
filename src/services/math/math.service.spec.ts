// test/unit/math.service.spec.ts


import { MathService } from "./math.service";

describe('MathService', () => {
  let service: MathService;

  beforeEach(() => {
    service = new MathService();
  });

  it('should return the sum of two numbers', () => {
    expect(service.add(2, 3)).toBe(5);
  });

  it('should return a negative sum', () => {
    expect(service.add(-5, -2)).toBe(-7);
  });
});