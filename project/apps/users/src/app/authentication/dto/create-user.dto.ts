import { ApiProperty } from '@nestjs/swagger';

export class CreateUserDto {
  @ApiProperty({
    description: 'User uniq email',
    example: 'user@user.ru',
  })
  public email: string;

  @ApiProperty({
    description: 'User name',
    example: 'Keks Ivanov',
  })
  public name: string;

  @ApiProperty({
    description: 'User password',
    example: '123456'
  })
  public password: string;
}
