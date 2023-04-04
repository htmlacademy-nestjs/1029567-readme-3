import { Document } from 'mongoose';
import { Prop, Schema, SchemaFactory } from '@nestjs/mongoose';
import { User } from '@project/shared/app-types';

@Schema({
  collection: 'readme-users',
  timestamps: true,
})
export class BlogUserModel extends Document implements User {
  @Prop({
    required: true,
    unique: true,
  })
  public email: string;

  @Prop({
    required: true,
  })
  public name: string;

  @Prop()
  public avatar: string;

  @Prop({
    required: true,
  })
  public passwordHash: string;

  @Prop()
  public postsCount: number;

  @Prop()
  public subscribersCount: number;

  @Prop({
    required: true,
  })
  public createDate: Date;
}

export const BlogUserSchema = SchemaFactory.createForClass(BlogUserModel);